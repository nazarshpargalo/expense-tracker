import { Query, Resolver } from '@nestjs/graphql';
import { ExpenseService } from './expense.service';

import * as cheerio from 'cheerio';

@Resolver()
export class ExpenseResolver {
  constructor(private readonly expenseService: ExpenseService) {}

  @Query(() => String)
  async getExpenses() {
    return 'Expenses';
  }
}
