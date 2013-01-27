Jasminerice::Engine.routes.draw do
  resources :spec, :controller => 'spec', :only => [:index] do
    get "fixtures/*filename", :action => :fixtures
  end
  match "fixtures/*filename", :to => "spec#fixtures", :via => :all
  match "/(:suite)", :to => "spec#index", :via => :all
end

if Jasminerice.mount
  Rails.application.routes.draw do
    mount Jasminerice::Engine => Jasminerice.mount_at
  end
end
