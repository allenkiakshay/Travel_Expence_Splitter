"use client"
import SignUpForm from '@/components/Auth/signUp'
import { useSelector } from 'react-redux'
import { RootState } from '../store'

export default function Home() {
  const user = useSelector((state: RootState)=> state.userState.user);

  console.log(user)
  return (
    <div className="">
      <SignUpForm/>
    </div>
  )
}
