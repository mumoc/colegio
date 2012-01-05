class Admin::ApplicationController < ApplicationController
  protect_from_forgery
  http_basic_authenticate_with name: "frodo", password: "bagins"
end
