# hbjydev.vim

My personal Vim installation & configuration Ansible role.

## Requirements

- Sudo permissions for the user being used to deploy your Ansible playbooks
- A package manager supported by the built-in `ansible.builtin.package` module

## Role Variables

- **`deploy_to_users`**: A list of users to deploy the vim configuration files to.

## Example Playbook

If you wanted to deploy my vim config to the users `john` and `sarah` on every host configured in your Ansible inventory, you would add this to your playbook.

```yml
- hosts: all
  roles:
    - role: hbjydev.vim
      vars:
        deploy_to_users:
          - john
          - sarah
```

## License

BSD

## Author Information

Written by [Hayden Young](https://github.com/hbjydev) -- contact me at [hi@hbjy.dev](mailto:hi@hbjy.dev)
