# Linguist action
![Linguist](https://github.com/fabasoad/linguist-action/workflows/Linguist/badge.svg?branch=master) ![Dockerfile Lint](https://github.com/fabasoad/linguist-action/workflows/Dockerfile%20Lint/badge.svg) [![Maintainability](https://api.codeclimate.com/v1/badges/13229b16ea7db1df48ff/maintainability)](https://codeclimate.com/github/fabasoad/linguist-action/maintainability) ![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/fabasoad/linguist-action?include_prereleases)

This action uses [github/linguist](https://github.com/github/linguist) library to detect language type for a file, or, given a repository, determine language breakdown in JSON format.

## Inputs

### `path`

_[Optional]_ Path to the repository. Default `"./"`.

### `percentage`

_[Optional]_ In case of `true` output will be in percentage format, otherwise - in fractions. Default `false`.

## Outputs

### `data`

Result in JSON format.
#### Examples
1. For folder in case of _percentage=true_:
```json
{
  "Ruby": "75.21%",
  "Dockerfile": "19.80%",
  "Shell": "5.00%"
}
```
2. For folder in case of _percentage=false_:
```json
{
  "Ruby": 0.7520556609740671,
  "Dockerfile": 0.19797596457938013,
  "Shell": 0.04996837444655281
}
```
3. For file:
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
      - uses: actions/checkout@v1
      - uses: fabasoad/linguist-action@v1.0.0
        id: linguist
        with:
          path: './'
          percentage: true
      - name: Print linguist result
        run: echo "${{ steps.linguist.outputs.data }}"
```

### Result
![Result](https://raw.githubusercontent.com/fabasoad/linguist-action/master/screenshot.png)