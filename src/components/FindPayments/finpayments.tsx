'use client'

import React, { useEffect, useState } from "react"
import FindMembers from "../Fetchdata/findmembers";
import { RootState } from "@/app/store";
import { useSelector } from "react-redux";
import Fetchpayments from "../Fetchdata/fetchpayments";

interface TeamMember {
    id: string;
    teamid: string;
    teamname: string;
    memid: string;
    memname: string;
    mememail: string;
    memphone: string;
    memrole: string;
    isverfied: boolean;
    createdAt: Date;
    updatedAt: Date;
};

interface Payment {
    id: string;
    teamid: string;
    teamname: string;
    creatememid: string;
    memname: string;
    mememail: string;
    amount: number;
    createdAt: Date;
  };

const Findpayments = (params: any) => {
    const teamid = params.teamid.params.team;
    const user = useSelector((state: RootState) => state.userState.user)
    const mememail = user ? user : ""

    const [teammembers, setTeammembers] = useState<TeamMember[] | string>([]);
    const [payments, setPayments] = useState<Payment[] | string>([]);
    const [admin, setAdmin] = useState(false);

    useEffect(() => {
        const verifyUser = async () => {
            const teammem = await FindMembers(mememail, teamid);

            setTeammembers(teammem);
        };
        verifyUser();
    }, [mememail, teamid]);

    useEffect(() => {
        const verifyUser = async () => {
            const response = await Fetchpayments(mememail, teamid);

            setPayments(response);
        };
        verifyUser();
    }, [mememail, teamid]);

    useEffect(() => {
        if (Array.isArray(teammembers)) {
            teammembers.forEach((mem) => {
                if (mem.mememail === mememail && mem.memrole === "admin") {
                    setAdmin(true);
                }
            });
        }
    }, [teammembers, mememail]);

    console.log(payments[0]);

    return (
        <div className="">
            <h1 className="text-[45px] m-[10px] p-[8px] text-center">Payment History</h1>
            {admin ? (
                <div className="">
                    <table className="min-w-full bg-white border border-gray-300">
                        <thead>
                            <tr>
                            <th className="py-2 px-4 border-b">Payment Id</th>
                            <th className="py-2 px-4 border-b">Team Id</th>
                            <th className="py-2 px-4 border-b">Team Name</th>
                            <th className="py-2 px-4 border-b">Amount You Paid</th>
                            </tr>
                        </thead>
                    {Array.isArray(payments) ? (
                        <>
                            {payments.map((payment) => (
                                    <tbody key={payment.creatememid}>
                                        <tr className="hover:bg-gray-100">
                                            <td className="py-2 px-4 border-b text-center">{payment.id}</td>
                                            <td className="py-2 px-4 border-b text-center">{payment.teamid}</td>
                                            <td className="py-2 px-4 border-b text-center">{payment.teamname}</td>
                                            <td className="py-2 px-4 border-b text-center">{payment.amount}</td>
                                        </tr>
                                    </tbody>
                            ))}
                        </>
                    ):null}
                    </table>
                </div>
            ) : (
                <div className="">
                    <h1 className="text-[25px] text-center">You Don't have access to add Payments</h1>
                </div>
            )}
        </div>
    );
};

export default Findpayments;