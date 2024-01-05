"use client"
import React, { useState } from "react";
import { useSelector } from "react-redux";
import { RootState } from "../store";
import Joinedteam from "@/components/Jointeam/jointeam";
import Createteam from "@/components/Createteam/createteam";
import Showteams from "@/components/Showteams/showteams";
import Createdteams from "@/components/Createteam/createdteams";
import Joinedteams from "@/components/Jointeam/joinedteams";


export default function Home() {
    const user = useSelector((state: RootState) => state.userState.user)

    const [Teamtype, setTeamtype] = useState('');

    return (
        <>
            {user === null?(
                <></>
            ):(
            <div className="">
                <button className={`m-[100px] p-[20px] border-[4px] border-black hover:bg-black hover:bg-opacity-30 ${Teamtype === 'create' ? "bg-black bg-opacity-30":""}`} onClick={()=> setTeamtype('create')}>
                    Create Team
                </button>
                <button className={`m-[100px] p-[20px] border-[4px] border-black hover:bg-black hover:bg-opacity-30 ${Teamtype === 'join' ? "bg-black bg-opacity-30":""}`} onClick={()=> setTeamtype('join')}>
                    Join Team
                </button>
                <button className={`m-[100px] p-[20px] border-[4px] border-black hover:bg-black hover:bg-opacity-30 ${Teamtype === 'show' ? "bg-black bg-opacity-30":""}`} onClick={()=> setTeamtype('show')}>
                    Show My Teams
                </button>
                {Teamtype === '' ? (
                    <></>
                ): Teamtype === 'join' ? (
                    <>
                    <Joinedteam/>
                    <Joinedteams/>
                    </>
                ): Teamtype === 'create' ? (
                    <>
                    <Createteam/>
                    <Createdteams/>
                    </>
                ): Teamtype === 'show' ? (
                    <Showteams/>
                ): null}
            </div>
            )}
        </>
    );
};