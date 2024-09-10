import { Query, Resolver } from '@nestjs/graphql';
import { ExpenseService } from './expense.service';

@Resolver()
export class ExpenseResolver {
  constructor(private readonly expenseService: ExpenseService) {}

  @Query(() => String)
  getExpenses() {
    return 'Expenses';
  }
}
