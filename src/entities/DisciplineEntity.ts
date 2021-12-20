import { Column, Entity, JoinColumn, ManyToOne, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { PeriodEntity } from "./PeriodEntity";
import { TestEntity } from "./TestEntity";

@Entity('disciplines')
export class DisciplineEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @ManyToOne(() => PeriodEntity, period => period.disciplines)
    @JoinColumn({ name: 'period_id' })
    period: PeriodEntity;

    @OneToMany(() => TestEntity, tests => tests.discipline)
    tests: TestEntity;

}
