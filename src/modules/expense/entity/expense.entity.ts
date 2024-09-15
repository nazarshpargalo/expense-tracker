import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('kontrahent')
export class Kontrahent {
  @PrimaryGeneratedColumn()
  id: number; // Corresponds to 'lp'

  @Column({ nullable: true })
  kontrahent: string; // Corresponds to 'kontrahent'

  @Column({ nullable: true })
  address: string; // Corresponds to 'address'

  @Column({ nullable: true })
  nip: string; // Corresponds to 'nip'

  @Column({ nullable: true })
  kod: string; // Corresponds to 'kod'

  @Column({ nullable: true })
  status: string; // Corresponds to 'status'

  @Column({ nullable: true })
  limitPozostalo: string; // Corresponds to 'limitPozostalo', no type specified

  @Column({ nullable: true })
  pozostalo: string; // Corresponds to 'pozostalo', no type specified

  @Column({ nullable: true })
  naleznosci: string; // Corresponds to 'naleznosci', no type specified

  @Column({ nullable: true })
  opiekun: string; // Corresponds to 'opiekun'

  @Column({ nullable: true })
  akcja: string; // Corresponds to 'akcja'

  @Column({ nullable: true })
  komentarz: string; // Corresponds to 'komentarz'
}
