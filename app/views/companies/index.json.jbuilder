json.array!(@companies) do |company|
  json.extract! company, :id, :name, :logo, :email, :phone, :fax, :website, :ref
  json.url company_url(company, format: :json)
end
