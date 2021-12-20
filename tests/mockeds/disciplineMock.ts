const mockDisciplines = [
        { id: expect.any(Number), name: '1°', disciplines: expect.any(Array)},
        { id: expect.any(Number), name: '2°', disciplines: expect.any(Array)},
        { id: expect.any(Number), name: '3°', disciplines: expect.any(Array)},
        { id: expect.any(Number), name: '4°', disciplines: expect.any(Array)},
        { id: expect.any(Number), name: '5°', disciplines: expect.any(Array)},
        { id: expect.any(Number), name: '6°', disciplines: expect.any(Array)},
        { id: expect.any(Number), name: '7°', disciplines: expect.any(Array)},
        { id: expect.any(Number), name: '8°', disciplines: expect.any(Array)}
    ]

export const mockDisciplinesWithCategoryAndTest = [
  {
    id: expect.any(Number),
    name: expect.any(String),
    tests: [
            {
                id: expect.any(Number),
                name: expect.any(String),
                link: expect.any(String),
                professor: {
                    id: expect.any(Number),
                    name: expect.any(String),
                },
            }
        ]
  }
]

export {
    mockDisciplines,
}