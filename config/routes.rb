Rails.application.routes.draw do
  get 'lotto/index'
  get 'lotto/result' => 'lotto#pick_and_check'
end
