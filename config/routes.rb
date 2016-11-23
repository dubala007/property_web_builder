Pwb::Engine.routes.draw do
  root to: 'welcome#index'
  resources :welcome, only: :index

  # TODO - get locales dynamically
  scope "(:locale)", locale: /en|nl|es|fr|de|pt|it|ca|ar/ do
    resources :welcome, only: :index

    get "/properties/for-rent/:id/:url_friendly_title" => "props#show_for_rent", as: "prop_show_for_rent"
    get "/properties/for-sale/:id/:url_friendly_title" => "props#show_for_sale", as: "prop_show_for_sale"
  end

  namespace :api do
    namespace :v1 do
      get "/client_translations/:locale" => "client_translations#index"
      get "/agency" => "agency#show"
      get "/infos" => "agency#infos"
      get "/web-contents" => "agency#infos"
    end
  end

end