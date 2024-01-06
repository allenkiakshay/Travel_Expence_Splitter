'use server'

import prisma from "@/lib/prisma";

const PaymentEntry = async (teamid: string, mememail: string, amount: number) => {

    const user = await prisma.createmember.findMany({
        where: {
            teamid,
            mememail
        }
    });

    if (user.length !== 0) {

        await prisma.createpayment.create({
            data: {
                teamid,
                teamname: user[0].teamname,
                creatememid: user[0].id,
                memname: user[0].memname,
                mememail,
                amount
            }
        });

        return true
    }

    return false
};

export default PaymentEntry;