import faker from 'faker';

export function generateDiscipline() {
    
    return {
        name: faker.name.findName(),
    }
}
