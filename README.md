# Fortellis Spec Lint Action

The Fortellis Spec Lint action performs automated validation and style recommendations for Open API 2.0 specifications. When a new or changed specification is included in a `push`, the action will gate the push on detected errors.

> For more info, see https://docs.fortellis.io

## Usage

The Fortellis Spec Lint action is intended to be used on `push` events. The action will automatically find the changed files and attempt to validate them if they have been added to the configuration.

```yaml
on: [push]

jobs:
  validate:
    steps:
    - uses: fortellis/spec-lint
    - name: Lint spec
```

## Prerequisites

* The repository has been previously initialized as a "Fortellis repo" via the Fortellis CLI.
  > `fortellis-cli init`
* The spec files must have been added to the configuration via the Fortellis CLI.
  > `fortellis-cli add -f {spec}`

## Input variables

```yaml
on: [push]

jobs:
  validate:
    steps:
    - uses: fortellis/spec-lint
    - name: Lint spec
```

## Output

```text
Spec valid
```

```text
Spec invalid
```

## Contributing

These actions were created to help create a better developer ex build better integrations between Fortellis and our partners using GitHub. We hope that others will be able to get the value from it that we have, and we welcome contributions from the community!

### Code of Conduct

We have adopted a Code of Conduct that we expect all contributors to adhere to. Please read the [code of conduct](https://github.com/Fortellis/fortellis-actions/blob/master/CODE_OF_CONDUCT.md) before contributing so that you know what is allowed as a part of this community.

## License

Fortellis-Actions is [MIT Licensed](https://github.com/Fortellis/fortellis-actions/blob/master/LICENSE)
