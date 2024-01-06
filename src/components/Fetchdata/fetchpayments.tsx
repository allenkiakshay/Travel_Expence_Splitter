'use server'

import prisma from "@/lib/prisma";

const Fetchpayments = async (email:string, teamid:string) => {
    const user = await prisma.user.findUnique({
        where:{
            email,
        }
    });

    if (user) {
        const mememail = email;

        const payments = await prisma.createpayment.findMany({
            where:{
                mememail,
                teamid
            }
        });

        return payments
    }

    return "User Does Not exist"

};

export default Fetchpayments;