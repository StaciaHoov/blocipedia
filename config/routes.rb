Rails.application.routes.draw do
  get 'welcome/idex'

  get 'welcome/about'

  root to: 'welcome#index'

end
