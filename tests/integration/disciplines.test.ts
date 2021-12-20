import '../../src/setup';
import supertest from 'supertest';
import app from '../../src/app';
import { init as inicialize } from '../../src/app';
import { getConnection, getRepository } from 'typeorm';
import { mockDisciplines, mockDisciplinesWithCategoryAndTest } from '../mockeds/disciplineMock';
import { DisciplineEntity } from '../../src/entities/DisciplineEntity';
import { PeriodEntity } from '../../src/entities/PeriodEntity';
import { generateDiscipline } from '../factories/disciplinesFactory';
import { ProfessorEntity } from '../../src/entities/ProfessorEntity';
import { generateProfessor } from '../factories/professorFactory';
import { generateCategory } from '../factories/categoryFactory';
import { CategoryEntity } from '../../src/entities/CategoryEntity';
import { TestEntity } from '../../src/entities/TestEntity';

beforeAll(async () => {
    await inicialize();
    await getRepository(PeriodEntity).delete({});
    await getRepository(DisciplineEntity).delete({});
})

afterAll(async () => {
    await getConnection().close();
}) 


describe('Routes /disciplines', () => {


    beforeEach(async () => {
        const periods = getRepository(PeriodEntity).create([
            { name: '1°' },
            { name: '2°' },
            { name: '3°' },
            { name: '4°' },
            { name: '5°' },
            { name: '6°' },
            { name: '7°' },
            { name: '8°' },
        ]);
        const savePeriods = await getRepository(PeriodEntity).save(periods);

        const disciplines = getRepository(DisciplineEntity).create({ name: generateDiscipline().name, period: savePeriods[0] })
        
        const saveDisciplines = await getRepository(DisciplineEntity).save(disciplines);

    })

    afterEach(async () => {
        await getRepository(PeriodEntity).delete({});
        await getRepository(DisciplineEntity).delete({});
    })

    test('should return status 200 and array with all disciplines registeds', async () => {
        console.log("baby", await getRepository(PeriodEntity).find());
        
        console.log('disciplines', await getRepository(DisciplineEntity).find());
        const result = await supertest(app).get('/disciplines');
        console.log("result.body", result.body);
        console.log('resul.stauts', result.status);
        expect(result.status).toEqual(200);
        expect(result.body).toEqual(mockDisciplines);
    });
})


describe('Routes /disciplines/:id/tests', () => {
    let saveDisciplines: DisciplineEntity;

    beforeEach(async () => {
        const periods = getRepository(PeriodEntity).create([
            { name: '1°' },
            { name: '2°' },
            { name: '3°' },
            { name: '4°' },
            { name: '5°' },
            { name: '6°' },
            { name: '7°' },
            { name: '8°' },
        ]);
        const savePeriods = await getRepository(PeriodEntity).save(periods);

        const disciplines = getRepository(DisciplineEntity).create({name: generateDiscipline().name, period: savePeriods[0] })
        
        saveDisciplines = await getRepository(DisciplineEntity).save(disciplines);

        const professor = getRepository(ProfessorEntity).create(generateProfessor());
        const saveProfessor = await getRepository(ProfessorEntity).save(professor);


        const category = getRepository(CategoryEntity).create(generateCategory())
        const saveCategory = await getRepository(CategoryEntity).save(category)

        console.log('saveP', savePeriods[0].id);
        console.log('saveD', saveDisciplines);
        console.log('savePr', saveProfessor);
        console.log('saveC', saveCategory);
        // const tests = getRepository(TestEntity).create({ ...generateCategory(), category: saveCategory[0], professor: saveProfessor[0], discipline: saveDisciplines[0] })
        const tests = getRepository(TestEntity).create({
            name: 'LFA',
            link: 'www.google.com',
            category: saveCategory,
            professor: saveProfessor,
            discipline: saveDisciplines,
        })

        const saveTests = await getRepository(TestEntity).save(tests);
        console.log(tests);
        console.log(saveTests);
        // 
    })

    afterEach(async () => {
        await getRepository(PeriodEntity).delete({});
        await getRepository(DisciplineEntity).delete({});
    })

    test('should return status 200 and an array like expected types equal in mo mockDisciplinesWithCategoryAndTest', async () => {
        console.log("baby", await getRepository(PeriodEntity).find());
        
        console.log('disciplines', await getRepository(DisciplineEntity).find());
        const result = await supertest(app).get(`/disciplines/${saveDisciplines.id}/tests`);
        console.log("result.body", result.body);
        console.log('resul.stauts', result.status);
        expect(result.status).toEqual(200);
        expect(result.body).toEqual(mockDisciplinesWithCategoryAndTest);
    });
})
