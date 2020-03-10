# Linguist action
![](https://github.com/fabasoad/linguist-action/workflows/Linguist/badge.svg)

This action uses _linguist_ library that is used on GitHub.com to detect blob languages, ignore binary or vendored files, suppress generated files in diffs, and generate language breakdown graphs in _JSON_ format.

## Inputs

### `path`

_[Optional]_ Path to the repository. Default `"./"`.

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
      - name: Print linguist result
        run: echo "${{ steps.linguist.outputs.data }}"
```