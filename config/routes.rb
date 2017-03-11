Rails.application.routes.draw do
  # resources :entries
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get ":locale-:category", locale: /uk|ru|en|be/,
    category: /g|wh|uh/,
    controller: "entries", action: "category", as: :category
  get ":locale-:course", locale: /uk|ru|en|be/,
    course: /g4|gk|g6|g7|g8|g9|g10|g11|gc|gr|uh5|uh7|uh8|uh9|uh10|uh11|wh6|wh7|wh8|wh9|wh10|wh11|ruby/,
    controller: "entries", action: "course", as: :course
  get ":locale-:course/:id.html", locale: /uk|ru|en|be/,
    course: /g4|gk|g6|g7|g8|g9|g10|g11|gc|gr|uh5|uh7|uh8|uh9|uh10|uh11|wh6|wh7|wh8|wh9|wh10|wh11|ruby/,
    id: /\d+/,
    controller: "entries", action: "show", as: :show_entry
end
