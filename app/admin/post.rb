ActiveAdmin.register Post do
    permit_params :title, :body, :anonimity, :author, :parent, :rating, :created_at, :updated_at
end