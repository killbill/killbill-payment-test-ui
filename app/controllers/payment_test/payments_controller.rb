# frozen_string_literal: true

require 'payment_test/client'

module PaymentTest
  class PaymentsController < EngineController
    def index
      raw_status = nil
      begin
        raw_status = ::Killbill::PaymentTest::PaymentTestClient.status(options_for_klient)
      rescue StandardError => e
        Rails.logger.warn("Failed to retrieve payment status : #{e}")
      end

      states = raw_status&.dig('states') || {}
      sleeps = raw_status&.dig('sleeps') || {}

      @status = if raw_status.nil?
                  'UNKNOWN'
                elsif states.empty? && sleeps.empty?
                  'CLEAR'
                elsif states.values.include?('ACTION_RETURN_PLUGIN_STATUS_ERROR')
                  'RETURN ERROR'
                elsif states.values.include?('ACTION_RETURN_PLUGIN_STATUS_PENDING')
                  'RETURN PENDING'
                elsif states.values.include?('ACTION_RETURN_PLUGIN_STATUS_CANCELED')
                  'RETURN CANCELED'
                elsif states.values.include?('ACTION_THROW_EXCEPTION')
                  'RETURN THROW'
                elsif states.values.include?('RETURN_NIL')
                  'RETURN NULL'
                elsif sleeps.any?
                  "SLEEP #{sleeps.values.first}"
                end

      @methods = if states.empty?
                   ['*']
                 else
                   states.keys
                 end
    end

    def set_failed_state
      new_state = params.require(:state)
      target_method = "set_status_#{new_state.to_s.downcase}"

      begin
        ::Killbill::PaymentTest::PaymentTestClient.send(target_method, nil, options_for_klient)
        flash[:notice] = "Status set to #{new_state}"
      rescue StandardError => e
        flash[:error] = "Failed to set state: #{e}"
        Rails.logger.error("Failed to set state: #{e.message}\n#{e.backtrace.join("\n")}")
      end

      redirect_to payment_test_engine.root_path and return
    end

    def reset
      begin
        ::Killbill::PaymentTest::PaymentTestClient.reset(nil, options_for_klient)
        flash[:notice] = 'Status cleared'
      rescue StandardError => e
        flash[:error] = "Failed to reset state: #{e}"
        Rails.logger.error("Failed to reset state: #{e.message}\n#{e.backtrace.join("\n")}")
      end
      redirect_to payment_test_engine.root_path and return
    end
  end
end
