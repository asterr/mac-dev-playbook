## Overview

The configuration files go under:

    ~/.config/gcloud/configurations

---

## Using configurations


    ➜  ~ gcloud config configurations create graphite
    Created [graphite].
    Activated [graphite].
    ➜  ~ gcloud auth login
    Your browser has been opened to visit:

      https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=32555940559.apps.googleusercontent.com&redirect_uri=http%3A%2F%2Flocalhost%3A8085%2F&scope=openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fappengine.admin+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fsqlservice.login+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcompute+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Faccounts.reauth&state=fFzVLaTQLjkPD1gmsRVwniBFegjVE0&access_type=offline&code_challenge=jCNAQcsM30F7f4jXNI8NKwJ6zEsE88c__q-ds6nx6u8&code_challenge_method=S256


    You are now logged in as [aaron.sterr@tradingscreen.com].
    Your current project is [mongoose-186309].  You can change this setting by running:  
      $ gcloud config set project PROJECT_ID
    
    ➜  ~ gcloud config set core/project mongoose-186309
    Updated property [core/project].

    ➜  ~ gcloud config set compute/zone us-east1-b
    Updated property [compute/zone].
    ➜  ~ gcloud config set compute/region us-east1
    Updated property [compute/region].

    ➜  ~ gcloud config configurations list
    NAME      IS_ACTIVE  ACCOUNT                        PROJECT          COMPUTE    _DEFAULT_ZONE  COMPUTE_DEFAULT_REGION   
    default   False      aaron.sterr@trad   ingscreen.com   
    graphite  True       aaron.sterr@trad   ingscreen.com  mongoose-186309    us-east1-b            us-east1   
    ➜  ~ gcloud config configurations activate graphite
    Activated [graphite].


---

## Example Configurations

_From 2022-08-25_

```
configurations/config_crypto-dev:    [core]
configurations/config_crypto-dev:    account = aaron.sterr@tradingscreen.com
configurations/config_crypto-dev:    project = crypto-migration-dev
configurations/config_crypto-dev:    [compute]
configurations/config_crypto-dev:    zone = us-east1-b
configurations/config_crypto-dev:    region = us-east1

configurations/config_default:    [core]
configurations/config_default:    project = sre-utils-000001
configurations/config_default:    account = aaron.sterr@tradingscreen.com
configurations/config_default:    [compute]
configurations/config_default:    zone = us-east1-b
configurations/config_default:    region = us-east1
configurations/config_default:    [proxy]

configurations/config_graphite:    [core]
configurations/config_graphite:    project = mongoose-186309
configurations/config_graphite:    account = aaron.sterr@tradingscreen.com
configurations/config_graphite:    [compute]
configurations/config_graphite:    zone = us-east1-b
configurations/config_graphite:    region = us-east1

configurations/config_kubetest:    [core]
configurations/config_kubetest:    project = mongoose-test3
configurations/config_kubetest:    account = aaron.sterr@tradingscreen.com
configurations/config_kubetest:    [compute]
configurations/config_kubetest:    zone = us-east1-b
configurations/config_kubetest:    region = us-east1

configurations/config_markts-qadev:    [core]
configurations/config_markts-qadev:    account = aaron.sterr@tradingscreen.com
configurations/config_markts-qadev:    project = crypto-migration-qadev-290903
configurations/config_markts-qadev:    [compute]
configurations/config_markts-qadev:    zone = us-central1-a
configurations/config_markts-qadev:    region = us-central1

configurations/config_markts-uatdev:    [core]
configurations/config_markts-uatdev:    account = aaron.sterr@marktsopen.io
configurations/config_markts-uatdev:    project = uatdev-core-201111
configurations/config_markts-uatdev:    [compute]
configurations/config_markts-uatdev:    region = us-central1
configurations/config_markts-uatdev:    zone = us-central1-a

configurations/config_marktsopen:    [core]
configurations/config_marktsopen:    project = markts-devops
configurations/config_marktsopen:    account = aaron.sterr@marktsopen.io
configurations/config_marktsopen:    [compute]
configurations/config_marktsopen:    region = us-central1
configurations/config_marktsopen:    zone = us-central1-a

configurations/config_pobox:    [core]
configurations/config_pobox:    account = asterr@pobox.com
configurations/config_pobox:    project = crypto-migration-qadev-290903

configurations/config_rubrik-poc:    [core]
configurations/config_rubrik-poc:    account = aaron.sterr@tradingscreen.com
configurations/config_rubrik-poc:    project = risk-rubrik-poc-001
configurations/config_rubrik-poc:    [compute]
configurations/config_rubrik-poc:    zone = us-east1-b
configurations/config_rubrik-poc:    region = us-east1

configurations/config_test:    [core]
configurations/config_test:    account = aaron.sterr@tradingscreen.com
configurations/config_test:    project = sre-secret-test-20201202

configurations/config_ts-uatdev:    [core]
configurations/config_ts-uatdev:    account = aaron.sterr@tradingscreen.com
configurations/config_ts-uatdev:    project = crypto-uatdev-app
configurations/config_ts-uatdev:    [compute]
configurations/config_ts-uatdev:    zone = us-east1-b
configurations/config_ts-uatdev:    region = us-east1

configurations/config_ts-uatprod:    [core]
configurations/config_ts-uatprod:    account = aaron.sterr@tradingscreen.com
configurations/config_ts-uatprod:    project = crypto-uatprod-app
configurations/config_ts-uatprod:    [compute]
configurations/config_ts-uatprod:    zone = us-east1-b
configurations/config_ts-uatprod:    region = us-east1

```