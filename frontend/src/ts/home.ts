import '../style/home.scss'

async function checkDatabaseHealth(): Promise<void> {
    const dbHealthText = document.getElementById('db-health');
    if(!dbHealthText) return;

    try {
        const response = await fetch('/api/health');
        const isDbActive: boolean = await response.json();

        if(isDbActive) { 
            dbHealthText.innerText = "on";
        } else {
            dbHealthText.innerText = "off";
        }
    } catch (err) {
        console.error("db health fetching error: ", err);
    }
}
