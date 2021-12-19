import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { CategoryEntity } from "./CategoryEntity";
import { DisciplineEntity } from "./DisciplineEntity";
import { ProfessorEntity } from "./ProfessorEntity";
@Entity('tests')
export class TestEntity {
    @PrimaryGeneratedColumn()
    id: number;
    
    @Column()
    name: string;

    @Column()
    link: string;

    @ManyToOne(() => CategoryEntity, category => category.tests, {eager : true})
    @JoinColumn({ name: 'category_id' })
    category: CategoryEntity;

    @ManyToOne(() => ProfessorEntity, professor => professor.test, {eager : true})
    @JoinColumn({ name: 'professor_id' })
    professor: ProfessorEntity;

    @ManyToOne(() => DisciplineEntity, discipline => discipline.test,{eager: true})
    @JoinColumn({ name: 'discipline_id' })
    discipline: DisciplineEntity;

    getTests () {
        return {
            name: this.name,
            link: this.link,
            category_name: this.category.name,
            professor_name: this.professor.name,
            discipline: this.discipline.name,
        }
    }
}