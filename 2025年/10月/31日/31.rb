# form_with の scope パラメータ
###scope: :session とすると、送られるパラメータは params[:session][:email] のような形式になる
= form_with url: login_path, scope: :session, local: true do |f|
    = f.label :email
    = f.text_field :email
  
  # 送信される params はこうなる：
  # {
  #   "session" => {
  #     "email" => "入力されたメール"
  #   }
  # }


