chmod +x wait-for-it.sh
./wait-for-it.sh postgres:5432 -- npm run migration:run
npm run start:prod
