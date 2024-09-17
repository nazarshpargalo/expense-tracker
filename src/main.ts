import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  console.log('test log 5');

  console.log({
    port: process.env.DATABASE_PORT,
    host: process.env.DATABASE_HOST,
    pass: process.env.DATABASE_PASSWORD,
    username: process.env.DATABASE_USERNAME,
    db_name: process.env.DATABASE_NAME,
  });
  const app = await NestFactory.create(AppModule);

  await app.listen(3000);
}
bootstrap();
