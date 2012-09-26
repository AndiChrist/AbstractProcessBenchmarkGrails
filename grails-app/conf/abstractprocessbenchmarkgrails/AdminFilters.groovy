package abstractprocessbenchmarkgrails

class AdminFilters {

    def filters = {
        adminOnly(controller:'*', action:'(create|edit|update|delete|save)') {
            before = {
                if (!session?.user?.admin) {
                    flash.message = "Sorry, admins only"
                    redirect (controller:"domain", action:"list") // start page for USERs
                    return false
                }

            }
        }
    }
}
