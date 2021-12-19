import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { DisciplineEntity } from "./DisciplineEntity";

@Entity('periods')
export class PeriodEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @OneToMany(() => DisciplineEntity, discipline => discipline.period)
    disciplines: DisciplineEntity[];

}