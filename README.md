# 含まれるもの

管理画面用にCookieベースの認証とAPI向けにfirebase authを用いたJWTトークンによる認証が実装済みです  
firebaseのプロジェクトは各自で用意してください

# 開発環境動かすまで

dockerが必要になります

各自の環境に合わせたdocker engineをインストールしてください

```
source env.sh
source nfs.env.sh  # NFS を使う場合（Linux ネイティブじゃないならこちらがおすすめ）
touch secrets.env
mkdir tmp/pids
build
bundle install
rake db:create ridgepole:apply
```

# 起動
以下はシェルを起動したら初めに

```
source env.sh
source nfs.env.sh # NFS を使う場合（Linux ネイティブじゃないならこちらがおすすめ）
```

をしてから行うこと。

## Spring server

シェルを1つ用意して

```
spring
```

と打ち込んで放置する。これで spring server が立ち上がり続ける。
基本的に spring server は常に起動しておく。
そうでないと rails console などが使えなくなる。

## Rails

別のシェルを用意して

```
app
```

とする。再起動する場合は `ctrl+c` で停止できる。うまく停止できなかったときは

```
stop app
app
```

で再起動する。

## Rails console

こちらも別のシェルを用意して

```
rails c
```

でOK。

# Seed

```
# 基本
rake db:seed_fu
```


# メール

MailCatcher http://localhost:1080/ で送られたメールを見れます

# 管理画面

url: `localhost:3000/management`

```
mail: admin@example.com
pass: password
```

# API

リクエストヘッダにJWTを含める必要があり、firebase authenticationによって生成されたidトークンで認証できます

なお、development環境では手元で作成したJWTで認証できます

rails consoleで以下のように実行することでトークンを発行できます

```ruby
user = User.first
claims = {
  'iss' => 'localhost',
  'aud' => 'localhost',
  'auth_time' => Time.zone.now.to_i,
  'sub' => user.firebase_uid,
  'iat' => Time.zone.now.to_i,
  'exp' => 1.year.from_now.to_i,
}

JWT.encode claims, nil, 'none'
```

### APIのアクセス例 (curlの場合)

```
curl "http://localhost:3000/api/private/me" \
     -H 'Authorization: Bearer eyJhbGciOiJub25lIn0.eyJpc3MiOiJsb2NhbGhvc3QiLCJhdWQiOiJsb2NhbGhvc3QiLCJhdXRoX3RpbWUiOjE1ODgzMDA4MjQsInN1YiI6InVzZXJfMSIsImlhdCI6MTU4ODMwMDgyNCwiZXhwIjoxNjE5ODM2ODI0fQ.' \
     -H 'Origin: ionic://localhost'
```
# syosetsh-no-mori
