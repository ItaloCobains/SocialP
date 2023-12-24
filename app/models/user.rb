class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]  # Adicione essa linha

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name  # Adicione essa linha se deseja capturar o nome do usuário do GitHub
      user.password = Devise.friendly_token[0, 20]
      # ... outros atributos, se necessário
    end
  end
end
