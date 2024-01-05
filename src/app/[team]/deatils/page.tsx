import Seeteammembers from "@/components/Teamdetails/seeteammembers";
import React from "react";

const Teamdetail = (params:any) => {
    return(
        <div className="">
            <Seeteammembers teamid={params}/>
        </div>
    )
}

export default Teamdetail;