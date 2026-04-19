# STANDARDS

## Purpose

`dev-standards` defines a universal engineering standard that can apply to almost any development project without assuming a specific topic, stack, architecture, or toolchain.

The standard is designed to remain useful across changing contexts by standardizing engineering behavior rather than domain content.

## Repository Model

The standard is organized into three layers:

- `core`: universal rules
- `profiles`: optional context-heavy practice packs
- `adapters`: tool or ecosystem specific application guides

This structure keeps the core small, strict, and broadly reusable.

## Core Rules

The universal core consists of twelve rules.

1. **Scope And Applicability**
2. **Repository Contract**
3. **Configuration And Environment**
4. **Change Management**
5. **Decision Records**
6. **Problem Tracking**
7. **Dependency Management**
8. **Verification**
9. **Interfaces And Contracts**
10. **Observability**
11. **Security And Risk**
12. **Documentation And Discoverability**

## Universality Test

A rule belongs in the core only if it remains useful:

- across project subjects
- across technology stacks
- across team sizes
- across delivery models
- across tool choices

If a rule is only strong in a recurring project shape, it belongs in a profile.
If a rule only makes sense because of a specific tool, it belongs in an adapter.

## Profiles

The initial profile set is:

- `research-data-ml`
- `ai-assisted-development`
- `incident-operations`
- `public-writing`

Profiles are optional. They may be strict when active.

## Adapters

The initial adapter set is:

- `github`
- `claude-code`
- `python`
- `typescript`
- `ci`

Adapters may tighten implementation details but must not redefine the core.

## Adoption Model

A project adopts the standard by composing:

- the universal core
- zero or more optional profiles
- zero or more adapters

## Index

- [core/README.md](core/README.md)
- [profiles/README.md](profiles/README.md)
- [adapters/README.md](adapters/README.md)
- [templates/README.md](templates/README.md)
- [migration/MIGRATION-GUIDE.md](migration/MIGRATION-GUIDE.md)

