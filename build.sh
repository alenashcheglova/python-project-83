#!/usr/bin/env bash
curl -LsSf https://astral.sh/uv/install.sh | sh
. $HOME/.local/bin/env

make install

if [[ -z "$DATABASE_URL" ]]; then
  echo "ERROR: DATABASE_URL is not available during build!"
  exit 1
fi

psql -a -d "$DATABASE_URL" -f database.sql