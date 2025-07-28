const { PrismaClient, Prisma } = require('@prisma/client');
const prisma = new PrismaClient();

module.exports.create = function create(code, name, credit) {
    return prisma.module.create({
        //TODO: Add data
        data: {
            modCode: code,
            modName: name,
            creditUnit: parseInt(credit)
        },

    })
        .then(function (module) {
            return module;
        })
        .catch(function (error) {
            if (error instanceof Prisma.PrismaClientKnownRequestError) {
                if (error.code === 'P2002') {
                    throw new Error('There is a unique constraint violation, a new module cannot be created')
                }
            };
            throw error
        });
};

module.exports.updateByCode = function updateByCode(code, credit) {
    return prisma.module.update({
        //TODO: Add where and data
        where: {
            modCode: code
        },
        data: {
            creditUnit: parseInt(credit)
        }
    }).then(function (module) {
        // Leave blank
    }).catch(function (error) {
        if (error instanceof Prisma.PrismaClientKnownRequestError) {
            if (error.code === 'P2025') {
                throw new Error('The module you wanna update doesnt exist ')
            }
        };
        throw error
    });
};

module.exports.retrieveAll = async function retrieveAll() {
    // TODO: Return all modules
    const data = await prisma.module.findMany()
    return data
};

module.exports.retrieveByCode = async function retrieveByCode(code) {
    try {
        console.log
        const module = await prisma.module.findUnique({
            where: {
                modCode: code
            }
        });
        if (!module) {
            throw new Error('Module not found');
        }
        return module;
    } catch (error) {

        throw error;
    }
};