# Linguist action
![Linguist](https://github.com/fabasoad/linguist-action/workflows/Linguist/badge.svg?branch=master)

This action uses _linguist_ library that is used on GitHub.com to detect blob languages, ignore binary or vendored files, suppress generated files in diffs, and generate language breakdown graphs in _JSON_ format.

## Inputs

### `path`

_[Optional]_ Path to the repository. Default `"./"`.

### `percentage`

_[Optional]_ In case of `true` output will be in percentage format, e.g. `{"Python":"100%"}`, otherwise - `false`, e.g. `{"Python":1.0}`. Default `false`.

## Outputs

### `data`

Result in JSON format. Example:
```json
{
    "JavaScript": 95,
    "Dockerfile": 5
}
```

## Example usage

```yaml
name: Linguist

on: push

jobs:
  linguist:
    name: Run linguist
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: fabasoad/linguist-action@v1
        id: linguist
        with:
          path: './'
          percentage: false
      - name: Print linguist result
        run: echo "${{ steps.linguist.outputs.data }}"
```