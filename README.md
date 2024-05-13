# OmniAuth PCS-2035

This gem contains the unofficial [PCS 2035](https://www.2035.university/) OAuth2 strategy for [OmniAuth](http://github.com/intridea/omniauth).

## Basic Usage

    Devise.setup do |config|
      config.omniauth :pcs2035, PCS2035_KEY, PCS2035_PRIVATE_KEY
    end

Callback url can be passed in order to match specified one on PCS2035 side in application preferences.

    Devise.setup do |config|
      config.omniauth :pcs2035, PCS2035_KEY, PCS2035_PRIVATE_KEY, callback_url: "http://example.com/auth/unti/callback"
    end

## Links

* https://2035.usedocs.com/article/56356

## Response hash

```
---
unti_id (int) id пользователя
email (str) емейл
lastname (str) фамилия
firstname (str) имя
secondname (str) отчество
gender (str) male|female
leader_id (str) id пользователя в leader-id
tags (list) список тегов пользователя
credentials:
  token:
  refresh_token:
  expires_at:
  expires: true
