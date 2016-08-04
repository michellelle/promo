Rails.configuration.stripe = { 
  publishable_key: ENV['stripe_publishable_key_pk_test_3eCsVdCaj6V0AwGDLkTMjtC5'], 
  secret_key: ENV['stripe_secret_key_sk_test_NjOOMGCyPpGY8xvpOxjETJuy']
    
} 

Stripe.api_key = Rails.configuration.stripe[:secret_key]