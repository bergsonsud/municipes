json.extract! municipe, :id, :name, :cpf, :cns, :email, :birthdate, :phone, :picture, :status, :address, :created_at,
              :updated_at
json.url municipe_url(municipe, format: :json)
