import { Module } from '@nestjs/common';
import { ExpenseResolver } from './expense.resolver';
import { ExpenseService } from './expense.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Kontrahent } from './entity/expense.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Kontrahent])],
  providers: [ExpenseResolver, ExpenseService],
})
export class ExpenseModule {}
