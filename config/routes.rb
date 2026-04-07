# frozen_string_literal: true

PaymentTest::Engine.routes.draw do
  root to: 'payments#index'

  resources :payments, only: [:index]

  scope '/payments' do
    post '/set_failed_state' => 'payments#set_failed_state', :as => 'set_failed_state'
    post '/reset' => 'payments#reset', :as => 'reset'
  end
end
