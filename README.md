# Linguist action

![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/fabasoad/linguist-action?include_prereleases) ![CI (latest)](https://github.com/fabasoad/linguist-action/workflows/CI%20(latest)/badge.svg) ![CI (main)](https://github.com/fabasoad/linguist-action/workflows/CI%20(main)/badge.svg) ![YAML Lint](https://github.com/fabasoad/linguist-action/workflows/YAML%20Lint/badge.svg) ![Ruby Lint](https://github.com/fabasoad/linguist-action/workflows/Ruby%20Lint/badge.svg) ![Dockerfile Lint](https://github.com/fabasoad/linguist-action/workflows/Dockerfile%20Lint/badge.svg) ![Shell Lint](https://github.com/fabasoad/linguist-action/workflows/Shell%20Lint/badge.svg) [![Known Vulnerabilities](https://snyk.io/test/github/fabasoad/linguist-action/badge.svg?targetFile=Gemfile.lock)](https://snyk.io/test/github/fabasoad/linguist-action?targetFile=Gemfile.lock)

This action uses [github/linguist](https://github.com/github/linguist) library to detect language type for a file, or, given a repository, determine language breakdown in JSON format.

## Inputs

| Name       | Required | Description                                                                     | Default | Possible values   |
|------------|----------|---------------------------------------------------------------------------------|---------|-------------------|
| path       | No       | Path to the repository                                                          | `./`    | _&lt;Path&gt;_    |
| percentage | No       | In case of `true` output will be in percentage format, otherwise - in fractions | `false` | _&lt;Boolean&gt;_ |

## Outputs

| Name | Required | Description           |
|------|----------|-----------------------|
| data | Yes      | Result in JSON format |

### Examples

- For folder in case of _percentage=true_:

```json
{
  "Ruby": "75.21%",
  "Dockerfile": "19.80%",
  "Shell": "5.00%"
}
```

- For folder in case of _percentage=false_:

```json
{
  "Ruby": 0.7520556609740671,
  "Dockerfile": 0.19797596457938013,
  "Shell": 0.04996837444655281
}
```

- For file:

```json
{
  "linguist.rb": {
    "lines": 56,
    "sloc": 48,
    "type": "Text",
    "mime_type": "application/x-ruby",
    "language": "Ruby"
  }
}
```

## Example usage

### Workflow configuration

```yaml
name: Linguist

on: push

jobs:
  linguist:
    name: Run linguist
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@main
      - uses: fabasoad/linguist-action@main
        id: linguist
        with:
          path: './'
          percentage: true
      - name: Print linguist result
        run: echo "${{ steps.linguist.outputs.data }}"
```

### Result

```shell
Run echo "{"Ruby":"75.21%","Dockerfile":"19.80%","Shell":"5.00%"}"
{Ruby:75.21%,Dockerfile:19.80%,Shell:5.00%}
```
