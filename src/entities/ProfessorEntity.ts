import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, OneToMany } from "typeorm";
import { TestEntity } from "./TestEntity";

@Entity('professors')
export class ProfessorEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @OneToMany(() => TestEntity, test => test.professor)
    test: TestEntity;
}