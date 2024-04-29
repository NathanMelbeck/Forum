const backToPast = () => {
    const router = useRouter();
    router.go(-1);
};

export default backToPast;