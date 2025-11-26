alias deck='docker run --env DECK_KONNECT_TOKEN=$KONNECT_TOKEN --env-file ./konnect_aigw_envars --r
m -v .:/files -w /files kong/deck'
