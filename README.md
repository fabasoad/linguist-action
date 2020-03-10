# Linguist action

This action uses a JavaScript wrapper for _linguist_ library that is used on GitHub.com to detect blob languages, ignore binary or vendored files, suppress generated files in diffs, and generate language breakdown graphs in _JSON_ format.

## Inputs

No inputs are needed.

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
    runs-on: ubuntu-18.04
    steps:
      - uses: actions/checkout@v1
      - uses: fabasoad/linguist-action@v1
        id: linguist
      - name: Print linguist result
        run: echo "${{ steps.linguist.outputs.data }}"
```