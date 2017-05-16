FactoryGirl.define do
  factory(:user) do
    # current_sign_in_at "2017-05-16T01:13 UTC"
    # current_sign_in_ip #<IPAddr: IPv4:127.0.0.1/255.255.255.255>
    email "cool@guy.com"
    # encrypted_password "$2a$11$N2slitspKZBplz9YDVp5DuU.tiRwo9qDKIGwTWQII4sse9MJbmqua"
    firstname "cool"
    password "123123"
    password_confirmation "123123"
    # last_sign_in_at "2017-05-16T01:05 UTC"
    # last_sign_in_ip #<IPAddr: IPv4:127.0.0.1/255.255.255.255>
    lastname "guy"
    # remember_created_at nil
    # reset_password_sent_at nil
    # reset_password_token nil
    # sign_in_count 2
  end
end
