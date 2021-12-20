import faker from 'faker';

export function generateCategory() {
    return {
        name: faker.name.firstName()
    }
}
