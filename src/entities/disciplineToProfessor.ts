// import { Entity, Column, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
// @Entity()
// export class PostToCategory {
//     @PrimaryGeneratedColumn()
//     id!: number;

//     @Column()
//     professor_id: number;

//     @Column()
//     discipline_id: number;

//     @ManyToOne(() => Post, post => post.postToCategories)
//     public post!: Post;

//     @ManyToOne(() => Category, category => category.postToCategories)
//     public category!: Category;
// }