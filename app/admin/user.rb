ActiveAdmin.register User do
    permit_params :name, :email, :id, :remember_created_at, :role
end