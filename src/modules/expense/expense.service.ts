import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import * as cheerio from 'cheerio';
import { Kontrahent } from './entity/expense.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ExpenseService {
  constructor(
    @InjectRepository(Kontrahent)
    private readonly kontrahentRepository: Repository<Kontrahent>,
  ) {}
}
