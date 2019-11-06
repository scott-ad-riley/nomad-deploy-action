# Nomad Deploy

Small GitHub Action that runs `nomad job run ...` with the Nomad CLI.

## Usage

Straightforward checkout then publish

```yaml
name: Run Tests & Publish Image
on: [push]
jobs:
  deploy:
    name: Nomad Deploy
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the code
        uses: actions/checkout@v1

      - name: Deploy with Nomad
        uses: scott-ad-riley/nomad-deploy
        with:
          token: '{{ secrets.YOUR_NOMAD_SECRET }}'
          address: '{{ secrets.YOUR_NOMAD_SERVER }}'
          job: path/to/your/nomad/job/file
          # optional:
          additional_vars: "SOME_IMAGE=some-value REGISTRY_AUTH_TOKEN=some-other-value"
```

## Parameters

* `token`: passed as `-token=` to the `nomad job run` command ([see here how to get one](https://www.nomadproject.io/guides/security/acl.html#acl-tokens))
* `address`: public address of a nomad server (passed as `-address=`)
* `job`: path to the nomad job specification to run ([defined according to the spec here](https://www.nomadproject.io/docs/job-specification/index.html))
* `additional_vars`: a string of env vars passed through to the nomad command that you can interpolate in your nomad job file ([see here](https://www.nomadproject.io/docs/runtime/interpolation.html)). Should be set as a string as if you would set them before the command normally (see example snippet above)

## Todo

- [ ] Verify it works
- [ ] Probably something else
